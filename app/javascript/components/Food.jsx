import React from "react";
import { Link } from "react-router-dom";

class Food extends React.Component {
  constructor(props) {
    super(props);
    this.state = { food: { nutrition: "" } };

    this.addHtmlEntities = this.addHtmlEntities.bind(this);
  }

  componentDidMount() {
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/show/${id}`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ food: response }))
      .catch(() => this.props.history.push("/foods"));
  }

  addHtmlEntities(str) {
  return String(str)
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">");
  }

  render() {
    const { food } = this.state;
    let nutrientList = "No nutrients available";
    if (food.nutrition.length > 0) {
      nutrientList = food.nutrition
        .split(",")
        .map((nutrition, index) => (
          <li key={index} className="list-group-item">
            {nutrition}
          </li>
        ));
    }
    const calories = this.addHtmlEntities(food.calories);

    return (
      <div className="">
        <div className="hero position-relative d-flex align-items-center justify-content-center">
          <img
            src={food.image}
            alt={`${food.name} image`}
            className="img-fluid position-absolute"
          />
          <div className="overlay bg-dark position-absolute"/>
          <h1 className="display-4 position-relative text-white">
            {food.name}
          </h1>
        </div>
        <div className="container py-5">
          <div className="row">
            <div className="col-sm-12 col-lg-3">
              <ul className="list-group">
                <h5 className="mb-2">Nutrition</h5>
                {nutrientList}
              </ul>
            </div>
            <div className="col-sm-12 col-lg-7">
              <h5 className="mb-2">Calories</h5>
              <div
                dangerouslySetInnerHTML={{
                  __html: `${calories}`
                }}
              />
            </div>
            <div className="col-sm-12 col-lg-2">
              <button type="button" className="btn btn-danger">
                Delete Food
              </button>
            </div>
          </div>
          <Link to="/foods" className="btn btn-link">
            Back to foods
          </Link>
        </div>
      </div>
    );
  }
}

export default Food;
