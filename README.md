# README

# MEETIO App

This application is made to help a small company to handle their meeting rooms.

* A user wants to be able to see all of the rooms available.
* A user wants to book a room if it has available spots.


## Architecture and models

There are two core models: Room and Booking with one-to-many relationship.
Each room can have many bookings with the foreign key field in the Bookings table, Room ID.

There are several assumptions that are reflected in the constants:
- office opening time
- time of the end of the working day
- minimum time slot duration that is available for booking

Depending on the above, the max amount of slots and the starting time of all slots per day are calculated.

## Revision required

- revise create booking method

- it may be necessary to send along with all free rooms a separate field showing the number of free slots per room

- or send all (not only free) rooms, but for each room display a field with the number of free slots. So on the front-end they will be able to show all the rooms but "disable" the occupied ones.

- add possibility of creating a multiple bookings for several rooms through one request

- it may be better for optimisation to create one more model that would store the number of booked/free slots per room, per day

- a part responsible for user authentication should also be added

- add tests


## Development

Rails version: 6.1.4.1

Ruby version: ruby 3.0.1


Clone the repository:

git clone https://github.com/IrinaOvdii/meetio.git

cd meetio
