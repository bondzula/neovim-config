local function readFiles(files)
    local dict = {}
    for _,file in ipairs(files) do
        if not file then return nil end

        for line in io.lines(file) do
            table.insert(dict, line)
        end
    end
    return dict
end

return {
	settings = {
		ltex = {
			language = "en-US",
			additionalRules = {
				enablePickyRules = true,
				languageModel = "$XDG_DATA_HOME/ngrams/",
			},
      dictionary = {
        ["en-US"] = readFiles({ vim.fn.stdpath("config") .. "/spell/dictionary.txt" } or {})
      },
      disabledRules = {
        ["en-US"] = readFiles({ vim.fn.stdpath("config") .. "/spell/disable.txt" } or {})
      },
      hiddenFalsePositives = {
        ["en-US"] = readFiles({ vim.fn.stdpath("config") .. "/spell/false.txt" } or {})
      },
		},
	},
}
