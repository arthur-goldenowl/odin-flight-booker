document.addEventListener("turbo:load", () => {
  const passengerFields = document.getElementById("passenger_fields");
  const addPassengerButton = document.getElementById("add_passenger");
  const removePassengerButton = document.getElementById("remove_passenger");

  addPassengerButton.addEventListener("click", (e) => {
    e.preventDefault();
    const passengerCount = document.querySelectorAll(".passenger").length;

    const newPassenger = document.createElement("div");

    newPassenger.classList.add("passenger");
    newPassenger.innerHTML = `
      <h4>Passenger ${passengerCount + 1}</h4>
      <p><label for="booking_passengers_attributes_${passengerCount}_name">Name</label>
      <input type="text" name="booking[passengers_attributes][${passengerCount}][name]" id="booking_passengers_attributes_${passengerCount}_name"></p>

      <p><label for="booking_passengers_attributes_${passengerCount}_email">Email</label>
      <input type="email" name="booking[passengers_attributes][${passengerCount}][email]" id="booking_passengers_attributes_${passengerCount}_email"></p>
    `;

    passengerFields.appendChild(newPassenger);

    if (passengerCount + 1 > 1) {
      removePassengerButton.style.display = "inline-block";
    }
  });

  removePassengerButton.addEventListener("click", (e) => {
    e.preventDefault();

    const passengers = document.querySelectorAll(".passenger");
    if (passengers.length > 1) {
      passengers[passengers.length - 1].remove();
    }

    if (passengers.length <= 2) {
      removePassengerButton.style.display = "none";
    }
  });
});
