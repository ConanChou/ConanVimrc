" soap
" Last Change: 2010-09-10
" Maintainer:   Yasuhiro Matsumoto <mattn.jp@gmail.com>
" License:      This file is placed in the public domain.
" Reference:
"   http://tools.ietf.org/rfc/rfc4743.txt

let s:save_cpo = &cpo
set cpo&vim

function! s:soap_call(url, func, ...)
  let envelope = xml#createElement("soap:Envelope")
  let envelope.attr["xmlns:soap"] = "http://schemas.xmlsoap.org/soap/envelope/"
  let envelope.attr["xmlns:xsi"] = "http://www.w3.org/2001/XMLSchema-instance"

  let body = xml#createElement("soap:Body")
  call add(envelope.child, body)
  let func = xml#createElement(a:func)
  call add(body.child, func)

  let n = 1
  for a in a:000
    let arg = xml#createElement("param".n)
    let arg.attr["xsi:type"] = "xsd:string"
    call arg.value(a)
    call add(func.child, arg)
    let n += 1
  endfor

  let str = '<?xml version="1.0" encoding="UTF-8"?>' . envelope.toString()
  let res = http#post(a:url, str)
  let dom = xml#parse(res.content)
  return s:parse_return(dom.find("return"))
endfunction

function! s:parse_return(node)
  if a:node.attr["xsi:type"] =~ ":Array$"
    let arr = []
    for item in a:node.child
      call add(ret, s:parse_return(item.child)
    endfor
    let ret = arr
  elseif a:node.attr["xsi:type"] =~ ":Map$"
    let ret = {}
    for item in a:node.childNodes("item")
      let val = item.childNode("value")
      if val.attr["xsi:type"] =~ ":Map$"
        let ret[item.childNode("key").value()] = s:parse_return(val)
      else
        let ret[item.childNode("key").value()] = item.childNode("value").value()
      endif
    endfor
  else
    if len(a:node.child)
      let arr = []
      for item in a:node.child
        call add(arr, s:parse_return(item)
      endfor
      let ret = arr
    else
      let ret = s:parse_return(a:node)
    endif
  endif
  return ret
endfunction

function! s:get_convert_code(arg)
  let code = ''
  let arg = a:arg
  if arg.type == "xsd:string"
    let code .= "let ".arg.name." = a:".arg.name
  elseif arg.type == "xsd:int"
    let code .= "let ".arg.name." = 0+a:".arg.name
  elseif arg.type == "xsd:boolean"
    let code .= "let ".arg.name." = (0+a:".arg.name.") ? 'true' : 'false'"
  elseif arg.type == "xsd:float"
    let code .= "let ".arg.name." = nr2float(0+a:".arg.name.")"
  elseif arg.type =~ ":Array$"
    let code .= "let ".arg.name." = a:".arg.name
  else
    throw "unknown type:". arg.type
  endif
  return code
endfunction

function! soap#proxy(url)
  let dom = xml#parseURL(a:url)
  let l:api = {}
  let action = dom.childNode("service").find("soap:address").attr["location"]
  let operations = dom.childNode("portType").childNodes("operation")
  for operation in operations
    let name = operation.attr["name"]
    let inp = substitute(operation.childNode("input").attr["message"], "^tns:", "", "")
    let out = substitute(operation.childNode("output").attr["message"], "^tns:", "", "")
    let message = dom.childNode("message", {"name": inp})
    let args = []
    for part in message.childNodes("part")
      call add(args, {"name": part.attr["name"], "type": part.attr["type"]})
    endfor
    let argnames = []
    let code = ""
    for arg in args
      call add(argnames, arg.name)
      let code .= "  ".s:get_convert_code(arg)."\n"
    endfor
    let code .= "  return s:soap_call(".string(action).", ".string(name).", ".join(argnames, ",").")\n"
    let source = "function! l:api.".name."(".join(argnames, ",").") dict\n"
    let source .= code
    let source .= "endfunction\n"
    exe source
  endfor
  return api
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
