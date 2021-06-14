let router = require('express').Router()
var controller = require('./controller')

router.route('/factory/:fac_id')
    .get(controller.getFactory)
    .post(controller.updateFactory)
    .put(controller.saveFactory)

router.route('/login/:user_id')
    .post(controller.login)

module.exports = router;