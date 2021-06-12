let router = require('express').Router()
var controller = require('./controller')

router.route('/factory/:fac_id')
    .get(controller.getFactorys)
    .post(controller.updateFactory)
    .put(controller.saveFactory)

router.route('/login/:user_id')
    .get(controller.getUser)
    .post(controller.login)
    .put(controller.saveUser)

module.exports = router;