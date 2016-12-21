({

	throwErrorForKicks: function(cmp) {
	

	try {

	if (!hasPerm) {

	throw new Error("You don't have permission to editis record.");

	}

	}

	catch (e) {

	// config for a dynamic ui:message component var componentConfig = {

	componentDef : "markup://ui:message", attributes : {

	values : {

	title : "Sample Thrown Error", severity : "error",

	body : [

	{

	componentDef :

	"markup://ui:outputText",

	attributes : { values : {

	value : e.message

	}

	}

	}

	]

}

}

};

$A.componentService.newComponentAsync(this,function(message) {
var div1 = cmp.find("div1");

// Replace existing body with the dynamic component
div1.set("v.body", message);
},
componentConfig
);



}

}

})