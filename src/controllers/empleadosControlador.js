const controller = {}

controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM empleado', (err, empleados) => {
            if (err) {
                res.json(err);
            }
            console.log(empleados);
            res.render('empleados', {
                data: empleados
            })
        })
    })
};

module.exports = controller;