const mysql = require('mysql2');

var pool = mysql.createPool({
    "user": process.env.MYSQLUSER,
    "password":process.env.MYSQLPASSWORD,
    "database":process.env.MYSQLDATABASE,
    "host":process.env.MYSQLHOST,
    "port":process.env.MYSQLPORT
});

exports.execute = (query, params=[])=>{
    return new Promise((resolve, reject)=>{
        pool.getConnection((error, conn)=>{
            if(error){
                reject(error)
            }else{
                conn.query(query, params, (error, result,filds)=>{
                    conn.release();
                    if(error){
                        reject(error);
                    }else{
                        resolve(result);
                    }
                });
            }
        })
    })
}

exports.pool = pool;