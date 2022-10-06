process.env.NODE_ENV = process.env.NODE_ENV || 'development'
process.env.BASE_URL = 'http://localhost:3000'
const environment = require('./environment')

module.exports = environment.toWebpackConfig()
