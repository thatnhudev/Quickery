import React from "react";
import Foods from "./Foods"
import AddNewPref from "./AddNewPref";
import Logo from "./Logo";

class App extends React.Component {
    render() {
        return (
            <div className="quickery">
                <div className="intro">
                    <Logo tagline="Quickly generate a grocery list that suits your dietary needs" />
                    <AddNewPref text="Start Now" />
                </div>
            </div>
        );
    }
}

export default App;
