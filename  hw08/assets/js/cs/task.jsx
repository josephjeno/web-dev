import React from 'react';
import { connect } from 'react-redux';
import { Card, CardBody, Button } from 'reactstrap';
import api from '../api';

function Task(params) {
    let task = params.task;
    let completedTask = "No";

    let minutes = task.time_spent;

    let increaseMinutes;
    let updateTask;



    function add_time(ev) {
        let time = parseInt(params.task.time_spent) + 15;

        let data = {id: params.task.id,
            completed: params.task.completed,
            description: params.task.description,
            title: params.task.title,
            user: params.task.user,
            time_spent: time};

        api.edit_task(data);
    }

    if (task.user.name === params.login.name) {
        updateTask = <Button onClick={update}>Mark Complete</Button>;
        increaseMinutes = <Button onClick={add_time}>Increase Time</Button>;
    }

    function update(ev) {
        completedTask = "Yes";
        updateTask = "";
    }

    if (task.completed) {
        completedTask = "Yes";
        updateTask = "";
    }

    return <Card>
        <CardBody>
            <div>
                <h4>{ task.title }</h4>
                <p>Assigned to <b>{ task.user.name }</b></p>
                <p>{ task.description }</p>
                <p>Time Spent: { minutes } Minutes {increaseMinutes}</p>
                <p>Completed?: { completedTask } {updateTask}</p>
            </div>
        </CardBody>
    </Card>;
}

function state2props(state) {
    console.log("rerender@Task", state);
    return {
        form: state.form,
        users: state.users,
    };
}

export default connect(state2props)(Task);