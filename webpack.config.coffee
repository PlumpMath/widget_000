c = -> console.log.apply console, arguments
path = require 'path'

module.exports = config =
    # worker:
    #     output:
    #         filename: "hash.worker.js"
    #         chunkFilename: "[id].hash.worker.js"
    node:
        fs: "empty"
    context: __dirname
    cache: true
    debug: true
    entry:
        app: ['./client_src/container.coffee']
    stats:
        colors: on
        reasons: on
    module:
        loaders: [
            # {
            #     test: /\.styl$/
            #     loader: 'style-loader!css-loader!stylus-loader'
            # },
            {
                test: /\.coffee$/
                loaders: ['coffee-loader']
            }
        ]

    output:
        path: __dirname
        filename: "client_build/widget.js"
