// check if the js works
console.log("frontpage.js works");

//waits for the html doc to be ready before atempting to run any js.
$(document).ready( () =>{

    // jquery getting our json order data from firebase
    $.get("http://localhost:8888/testGet", (data) => {    
        // i is for the index of the array of orders
        let i = 0;    
        //for each loop through our array list
        $.each(data, function () {
            //console.log(data)
            //console.log(i);
            // is how we arrange the data and show it to the frontpage
            $(`<div id = order_box>
                Customer:   ${data[i].customer}<br>
                Date:       ${data[i].date}<br>
                Total:      ${data[i].total}</div>`
            ).appendTo("#frontpage_box");        
            // counts 1 up for each loop 
            i++;
            //console.log(i);
        
        });
    });

/*
    // dummy current day/moth/year
    const date = new Date();
    let time = date.toDateString()

    //dummy data list of orders
    let orders = [
        { id: "1", customer: "Mads", date: time, total: 100 },
        { id: "2", customer: "Emil", date: time, total: 80 },
        { id: "3", customer: "Mie", date: time, total: 180 },
        { id: "4", customer: "Mikkel", date: time, total: 300 },
        { id: "5", customer: "Oliver", date: time, total: 300 },
    ];
*/    

});



