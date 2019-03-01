local ran_ok, error = pcall(function() local kpse = require("kpse") kpse.set_program_name("luatex") local lfs = require("lfs") local cacheDir = "./_markdown_econ-pdflatex" if not lfs.isdir(cacheDir) then assert(lfs.mkdir(cacheDir)) end local md = require("markdown") local convert = md.new({cacheDir = "./_markdown_econ-pdflatex", citations = true, citationNbsps = true, definitionLists = true, footnotes = true, fencedCode = true, hashEnumerators = true, hybrid = true, inlineFootnotes = true, } ) local input = assert(io.open("econ-pdflatex.markdown.in", "r"):read("*a")) print(convert(input:gsub("\r\n?", "\n"))) end) if not ran_ok then local file = io.open("./econ-pdflatex.markdown.err", "w") if file then file:write(error .. "\n") file:close() end print('\\markdownError{An error was encountered while executing Lua code}{For further clues, examine the file "./econ-pdflatex.markdown.err"}') end