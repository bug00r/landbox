-- This config File should include only lua code

build = {
     name = "msys", -- others linux or windows: overwritable with arg?
     path = {
        { 
            drive = "C", -- only needed on config.name = windows and msys for absolute paths
            name = "my/relative/path"
        },
        {
            drive = "C", -- only needed on config.name = windows and msys for absolute paths
            name = "/my/absolute/path" 
        }
     }
}