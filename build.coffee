fs = require "fs"
path = require 'path'
glob = require 'glob'

OUTDIR = 'dist'

doBuild = (odir = OUTDIR, cb)->
  fs.mkdir odir, ->
    glob 'pages/*', (err, files) ->
      fs.writeFile path.join(odir, "index.html"), JSON.stringify(files), (error) ->
        cb null


module.exports = {doBuild}

if require.main is module
  od = process.argv[2] || OUTDIR
  doBuild od, ->
    console.log "done"
