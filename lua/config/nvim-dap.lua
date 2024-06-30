local dap_cortex_debug = require('dap-cortex-debug')
local dap = require('dap')
local dapui = require('dapui')

dap_cortex_debug.setup {
	debug = false,
	extension_path = nil,
	lib_extension = nil,
	node_path = 'node',
	dapui_rtt = false,
	dap_vscode_filetypes = { 'c', 'cpp' }
}

dap.configurations.c = {
    dap_cortex_debug.openocd_config {
        name = 'RP2040 SDK project debugging with OpenOCD',
        cwd = '${workspaceFolder}',
        executable = '${workspaceFolder}/debug/program.elf',
        configFiles = { 
			'${workspaceFolder}/cmsis-dap.cfg',
			'${workspaceFolder}/rp2040-tweaks.cfg',
			'${workspaceFolder}/rp2040.cfg'
		},
        gdbTarget = 'localhost:3333',
        rttConfig = nil,
        showDevDebugOutput = false,
    },
}

require('dapui').setup {
    layouts = {
        {
            position = 'left',
            size = 64,
            elements = {
                { id = 'scopes', size = 0.3 },
				{ id = 'watches', size = 0.3 },
				{ id = 'stacks', size = 0.4 }
            },
        },
    },
}
