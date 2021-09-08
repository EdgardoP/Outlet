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

controller.save = (req, res) => {
    const data = req.body;
    console.log(data);
    req.getConnection((err, conn) => {
        conn.query('INSERT INTO empleado set ?', [data], (err, empleado) => {
            console.log(empleado);
            res.redirect('/')
        })
    })
}

controller.delete = (req, res) => {
    const { id } = req.params
    req.getConnection((err, conn) => {
        conn.query('DELETE FROM empleado where idEmpleado = ? ', [id], (err, rows) => {
            res.redirect('/');
        })
    })
}
module.exports = controller;