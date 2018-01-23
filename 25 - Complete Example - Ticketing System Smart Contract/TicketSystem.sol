pragma solidity ^0.4.18;

/** @title Ticket System.*/
contract TicketSystem{
    /*
    * @title Ticket System Example
    * @author Toshendra Sharma
    * @notice Example for the Certified Solidity Course
    */
    address private admin;
    uint public totalTickets;
    uint public totalTicketsSold;
    uint public ticketPrice;
    uint private totalRevenue;
    string public standard = "TICKETINGSYSTEM-0.1";
    mapping(uint => address) public seatsToAttendees;
    mapping(address => uint) public attendeesToSeats;

    event TicketPurchasedEvent(address indexed _attendee, uint _amount);

    modifier onlyAdmin {
        require(msg.sender == admin);
        _;
    }

    function TicketSystem(uint inTotalTickets, uint inTicketPrice) public{
        admin = msg.sender;
        totalRevenue = 0;
        totalTicketsSold = 0;
        totalTickets = inTotalTickets;
        ticketPrice = inTicketPrice;
    }

    /** @dev Returns the number of unconsumed tickets per user
    *
    */
    function getUserTicketCount() public view returns (uint){
      return attendeesToSeats[msg.sender];
    }

    /**@dev Purchases tickets for the event
    * @param amount Number of tickets to purchase.
    */
    function purchaseTicket(uint amount) public payable returns (bool){
        uint transactionTotal = amount * ticketPrice;
        // verify: (1) tickets left, (2) amount is >0, (3) user has the money
        if((amount + totalTicketsSold <= totalTickets) && (amount > 0) && (msg.value>transactionTotal)){

        // track the total revenue
        totalRevenue += transactionTotal;
        // send it to admin account
        for (uint i = totalTicketsSold + 1; i < totalTicketsSold + amount + 1; i++) {
            seatsToAttendees[i] = msg.sender;
        }
        attendeesToSeats[msg.sender] += amount;
        totalTicketsSold += amount;
        totalTickets -= amount;
        TicketPurchasedEvent(msg.sender, amount);
        return true;
        } else{
            return false;
        }
  }

    function withdrawAll() onlyAdmin public payable returns (bool){
          uint amount = totalRevenue;
          // Remember to zero the pending refund before
          // sending to prevent re-entrancy attacks
          totalRevenue = 0;
          msg.sender.transfer(amount);
    }
}
