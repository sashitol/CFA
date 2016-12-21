({
    getInput : function(cmp, event) {
        var fullname=cmp.get
        var fullName = cmp.find("name").get("v.value");
        var outName = cmp.find("nameOutput");
    outName.set("v.value", fullName);
}})