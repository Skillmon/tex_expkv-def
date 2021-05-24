-- Build script for expkv-def
module     = "expkv-def"
pkgversion = "0.8a"
pkgdate    = "2021-05-24"

-- update package date and version
tagfiles = {"expkv-def.dtx", "README.md", "CTAN.md"}
function update_tag(file, content, tagname, tagdate)
  if tagname == nil then
    tagname = pkgversion
    tagdate = pkgdate
  end
  if string.match(file, "%.md") then
    return string.gsub(content,
      "%d%d%d%d%-%d%d%-%d%d v%d%.%d%w?",
      tagdate .. " v" .. tagname)
  elseif file == "expkv-def.dtx" then
    content = string.gsub(content,
      "\\def\\ekvdDate{%d%d%d%d%-%d%d%-%d%d}",
      "\\def\\ekvdDate{" .. tagdate .. "}")
    return string.gsub(content,
      "\\def\\ekvdVersion{%d%.%d%w?}",
      "\\def\\ekvdVersion{" .. tagname .. "}")
  end
  return content
end

-- test with pdfTeX and the LaTeX format
checkengines = {"pdftex"}
checkformat  = "latex"

-- from which files to build
sourcefiles = {"expkv-def.dtx"}
unpackfiles = sourcefiles

-- which files to put in the tds
installfiles = {"expkv-def.sty", "expkv-def.tex"}
textfiles    = {"README.md", "CTAN.md"}
docfiles     = {"expkv-def.pdf"}

-- how the documentation is build
typesetfiles = {"expkv-def.dtx"}
typesetruns  = 4

-- make sure that expkv-def.tex ends up in the generic path
packtdszip   = true
tdslocations = {
  "tex/generic/expkv-def/expkv-def.tex",
}

-- CTAN upload
ctanreadme    = "CTAN.md"
uploadconfig  = {
  pkg         = module,
  author      = "Jonathan P. Spratte",
  version     = pkgversion .. " " .. pkgdate,
  license     = "lppl1.3c",
  summary     = "A key-defining frontend for expkv",
  topic       = "keyval",
  ctanPath    = "/macros/generic/expkv-def",
  repository  = "https://github.com/Skillmon/tex_expkv-def",
  bugtracker  = "https://github.com/Skillmon/tex_expkv-def/issues",
  update      = true,
  description = [[
`expkv-def` is a frontend to define keys for the `expkv` key=val implementation.
It provides the defining frontend

* `\ekvdefinekeys{<set>}{<prefix> <key>=<definition>, ...}`
  ]]
}
