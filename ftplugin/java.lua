-- nvim-jdtls configuration, loaded automatically for Java files
-- See: https://github.com/mfussenegger/nvim-jdtls

if vim.g.vscode then
    return
end

local jdtls = require("jdtls")

local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
local jdtls_path = mason_path .. "/jdtls"
local lombok_path = jdtls_path .. "/lombok.jar"

-- jdtls requires Java 21+; JAVA_HOME may point to Java 8, so find a suitable JDK
local function find_jdtls_java()
    local candidates = {
        "/Library/Java/JavaVirtualMachines/temurin-26.jdk/Contents/Home/bin/java",
        vim.fn.trim(vim.fn.system("/usr/libexec/java_home -v 21 2>/dev/null")) .. "/bin/java",
        vim.fn.trim(vim.fn.system("/usr/libexec/java_home -v 17 2>/dev/null")) .. "/bin/java",
    }
    for _, java in ipairs(candidates) do
        if vim.fn.executable(java) == 1 then
            return java
        end
    end
    return "java"
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

local bundles = {}

-- java-debug-adapter (if installed via Mason)
local debug_jar = vim.fn.glob(
    mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true
)
if debug_jar ~= "" then
    table.insert(bundles, debug_jar)
end

-- java-test (if installed via Mason)
local test_jars = vim.fn.glob(
    mason_path .. "/java-test/extension/server/*.jar", true, true
)
for _, jar in ipairs(test_jars or {}) do
    if not vim.endswith(jar, "com.microsoft.java.test.runner-jar-with-dependencies.jar") then
        table.insert(bundles, jar)
    end
end

local config = {
    cmd = {
        find_jdtls_java(),
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. lombok_path,
        "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration", jdtls_path .. "/config_mac_arm",
        "-data", workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

    settings = {
        java = {
            signatureHelp = { enabled = true },
            completion = {
                favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.mockito.Mockito.*",
                    "org.mockito.ArgumentMatchers.*",
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
        },
    },

    init_options = {
        bundles = bundles,
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },

    on_attach = function(client, bufnr)
        -- Register jdtls commands so Neovim 0.12's Client:exec_cmd can find them
        for cmd_name, cmd_fn in pairs(jdtls.commands) do
            if not vim.lsp.commands[cmd_name] then
                vim.lsp.commands[cmd_name] = cmd_fn
            end
        end

        -- Setup debug adapter if java-debug is available
        if #bundles > 0 then
            pcall(jdtls.setup_dap, { hotcodereplace = "auto" })
            pcall(require("jdtls.dap").setup_dap_main_class_configs)
        end

        local opts = { buffer = bufnr }
        vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, vim.tbl_extend("force", opts, { desc = "Java: organize imports" }))
        vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, vim.tbl_extend("force", opts, { desc = "Java: extract variable" }))
        vim.keymap.set("v", "<leader>jv", function() jdtls.extract_variable(true) end, vim.tbl_extend("force", opts, { desc = "Java: extract variable" }))
        vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, vim.tbl_extend("force", opts, { desc = "Java: extract constant" }))
        vim.keymap.set("v", "<leader>jc", function() jdtls.extract_constant(true) end, vim.tbl_extend("force", opts, { desc = "Java: extract constant" }))
        vim.keymap.set("v", "<leader>jm", function() jdtls.extract_method(true) end, vim.tbl_extend("force", opts, { desc = "Java: extract method" }))
        vim.keymap.set("n", "<leader>jt", jdtls.test_nearest_method, vim.tbl_extend("force", opts, { desc = "Java: test nearest method" }))
        vim.keymap.set("n", "<leader>jT", jdtls.test_class, vim.tbl_extend("force", opts, { desc = "Java: test class" }))
    end,
}

jdtls.start_or_attach(config)
