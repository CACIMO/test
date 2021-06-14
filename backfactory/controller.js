const models = require('./models')
module.exports = {
    getFactory: (req, res) => {
        res.status(200).send({})
    },
    saveFactory: (req, res) => {
        res.status(200).send({})
    },
    updateFactory: (req, res) => {
        res.status(200).send({})
    },
    login: (req, res) => {

        models.User.find({ user: req.body.user, pwd: req.body.pwd }, (err, data) => {

            console.log(data);
            if (err) res.status(400).json({
                err: err
            })
            else {
                if (data && data.length) {
                    res.status(200).json({
                        data: data
                    })
                } else {
                    res.status(401).json({
                        err: err
                    })
                }
            }
        });
    }
}