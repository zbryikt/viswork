view = new ldview do
  root: document.body
  action: click: copy: ({node}) ->
    link = ld$.find(node.parentNode, 'a', 0).getAttribute \href
    if !/^https?:/.exec(link) => link = window.location.href + link
    navigator.clipboard.writeText link
    node.classList.toggle \tip-on, true
    setTimeout (-> node.classList.toggle \tip-on, false), 1000
