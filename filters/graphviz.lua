-- inspired by https://github.com/pandoc/lua-filters/blob/5686d96/diagram-generator/diagram-generator.lua

local dotPath = os.getenv("DOT") or "dot"

local filetype = "pdf"
local mimetype = "image/svg+xml"

local function graphviz(code, filetype, outname)
    return pandoc.pipe(dotPath, {"-T" .. filetype, "-o" .. outname}, code)
end

function CodeBlock(block)
    local converters = {
        graphviz = graphviz,
    }

    local img_converter = converters[block.classes[1]]
    if not img_converter then
      return block
    end

    local fname = 'temp/' .. pandoc.utils.sha1(block.text) .. '.pdf'
    local success, img = pcall(img_converter, block.text, filetype, fname)

    if not success then
        io.stderr:write(tostring(img))
        io.stderr:write('\n')
        error 'Image conversion failed. Aborting.'
    end
    return {
      pandoc.RawInline('latex', '\\hfill\\break{\\centering'),
      pandoc.Image({}, fname, '', block.attr),
      pandoc.RawInline('latex', '\\par}')

    } 
end

return {
    {CodeBlock = CodeBlock},
}
