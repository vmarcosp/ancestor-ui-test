@module("@emotion/css") external css: {..} => string = "css"
@module("@emotion/css") external rawCss: string => string = "css"
@module("@emotion/css") external keyframes: {..} => string = "keyframes"
@module("@emotion/css") external injectGlobal: {..} => unit = "injectGlobal"
@module("@emotion/css") external compose: (string, string) => string = "compose"

