console.log("frontpage.js works");

$(document).ready( () =>{

    // current day/moth/year
    const date = new Date();
    let time = date.toDateString()

    //dummy data list of orders
    let orders = [
        { id: "1", customer: "Mads", date: time, items: JSON.stringify([{apple: 50, coffee: 100}]), total: 100 },
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
            Items:       ${this.items}<br>
            Total:      ${this.total}</div>`
        ).appendTo("#frontpage_box");        
    });

});



