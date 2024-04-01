# JAMS


title Search Available Vehicles

User->SearchInterface:Initiate search with\ndate, [vehicle type]
note over SearchInterface:Processes user input
SearchInterface->VehicleDatabase:getAvailableVehicles(date, [vehicleType])
note over VehicleDatabase, SearchInterface:Optional vehicle type filter
VehicleDatabase-->SearchInterface:List of available vehicles
SearchInterface-->User:Display search results

User->ReservationInterface:Search reservation with\nname, date
note over ReservationInterface:Processes search criteria
ReservationInterface->ReservationDatabase:findReservation(name, location)
ReservationDatabase-->ReservationInterface:List of matching reservations
ReservationInterface-->User:Display search results

