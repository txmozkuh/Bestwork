exports.candidate = function(req,res,next){
    if(req.user) {
        if(req.user.type !== 0){
            res.send("You must log in with candidate account !!!");
        } else {
            return next();
        }
    } else {
        res.send('You  have not log in yet !!!');
    }
}

exports.recruiter = function(req,res,next){
    if(req.user) {
        if(req.user.type !== 1){
            res.send("You must log in with candidate account !!!");
        } else {
            return next();
        }
    } else {
        res.send('You  have not log in yet !!!');
    }
}