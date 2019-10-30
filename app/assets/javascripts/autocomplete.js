//by adding componentRestrictions: {country:’australia’ } we limit the search to Australia

    function initializeAutocomplete(id) {
        console.log('initializeAutocomplete', id);
        const element = document.getElementById(id);
        if (element) {
            const autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'], componentRestrictions: {country: 'au'} });
            google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
        }
    }

    //$("#autocomplete_address").keyup(initializeAutocomplete);

    function onPlaceChanged() {
        const place = this.getPlace();


        console.log(place);  // Uncomment this line to view the full object returned by Google API.

        for (const i in place.address_components) {
            const component = place.address_components[i];
            for (const j in component.types) {  // Some types are ["country", "political"]
                const type_element = document.getElementById(`autocomplete_${component.types[j]}`);
                if (type_element) {
                    type_element.value = component.long_name;
                }
            }
        }

        const lat = place['geometry']['location'].lat();
        const lat_element = document.getElementById(`autocomplete_${'latitude'}`);
        // debugger
        if (lat_element) {
            lat_element.value = lat;
        }

        // debugger

        const lng = place['geometry']['location'].lng();
        const lng_element = document.getElementById(`autocomplete_${'longitude'}`);
        if (lng_element) {
            lng_element.value = lng;
        }
    }
        initializeAutocomplete('autocomplete_address');
