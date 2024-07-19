require('flutter-tools').setup({
  debugger = {
    enabled = true,
    run_via_dap = true,
    register_configurations = function(_)
      local dap = require('dap')
      dap.adapters.flutter = {
        command = 'flutter',
        args = {
          'debug_adapter',
        },
      }
      dap.configurations.dart = {
        {
          name = 'Launch Dart Console Application',
          type = 'dart',
          request = 'launch',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',
        },

        {
          name = 'Launch Flutter Application',
          type = 'executable',
          request = 'launch',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',
          deviceId = '127.0.0.1:5555',
        },
      }
    end,
  },
})
