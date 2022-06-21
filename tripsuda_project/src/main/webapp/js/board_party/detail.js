/**
 *  
 */

let form = {
    anum : 0,
    actiontype : '', // activate, deactivate, join, leeeeave
};

sendForm = function(anum, atype) 
{
    form.anum = anum;
    form.actiontype = atype;

	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText; 
            console.log(result);
            location.reload();
		}
	};
	let url = sessionStorage.getItem("contextPath")
		 + "/html&jsp/board_party/detail";
    console.log(form);
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8;");
	xhr.send(JSON.stringify(form));
}