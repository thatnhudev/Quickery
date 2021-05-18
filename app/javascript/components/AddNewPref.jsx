import React from "react";
import { Link } from "react-router-dom";
import PropTypes from "prop-types";

const AddNewPref = props => (
  <div className="new-pref">
    <Link
      to="/foods"
      className="btn btn-lg custom-button"
      role="button">
      {props.text}
    </Link>
  </div>
);

AddNewPref.propTypes = {
  text: PropTypes.string.isRequired
};

export default AddNewPref;