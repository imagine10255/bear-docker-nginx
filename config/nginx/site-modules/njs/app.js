function hello(req) {
    var result = { code: 200, desc: "Hello world!" };

    req.headersOut["Content-Type"] = "application/json;charset=UTF-8";
    req.return(200, JSON.stringify(result));
}


export default {hello};
