import React, {useState, createContext} from 'react';

export const RestaurantContext = createContext();

export const RestaurantContextProvider = props => {
    const [restaurants, setRestaurants] = useState([]);
    const [selectedRestaurant, setSelectedRestaurant] = useState(null);
    
    const addRestaurant = (restaurant) => {
        setRestaurants([...restaurants, restaurant])
    }

    return (
        <RestaurantContext.Provider value={{restaurants, setRestaurants, selectedRestaurant, setSelectedRestaurant, addRestaurant}}>
            {props.children}
        </RestaurantContext.Provider>
    )
}