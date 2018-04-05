import React from 'react';
import { ListGroup, ListGroupItem } from 'reactstrap';
import { Link } from 'react-router-dom';

function User(params) {
    return <ListGroupItem><Link to={"/users/" + params.user.id}>{params.user.name}</Link></ListGroupItem>;
}

export default function Users(params) {
    let users = _.map(params.users, (uu) => <User key={uu.id} user={uu} />);
    return <div>
        <ListGroup>
        { users }
        </ListGroup>
    </div>;
}