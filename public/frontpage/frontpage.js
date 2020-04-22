console.log("frontpage.js works");

$(document).ready( () =>{

    $.get("http://localhost:8888/testGet", (data) => {    
        let i = 0;    
        $.each(data, function () {
            console.log(data)
        });

        console.log(i);
        $(`<div id = order_box>
            Customer:   ${data[i].customer}<br>
            Date:       ${data.date}<br>
            Total:      ${data.total}</div>`
        ).appendTo("#frontpage_box");        
        i++;

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
    
    // Jquery for each function 
    $.each(orders, function () {
        
        $(`<div id = order_box>
            Id:         ${this.id}<br>
            Customer:   ${this.customer}<br>
            Date:       ${this.date}<br>
            Total:      ${this.total}</div>`
        ).appendTo("#frontpage_box");        
    });
*/

});



