import React from 'react';
import Task from './task.jsx';

export default function Feed(params) {
    let tasks = _.map(params.tasks, (pp) => <Task key={pp.id} task={pp} login={params.login} />);

    if (params.token) {
        return <div>
            { tasks }
        </div>;
    } else {
        return <div></div>;
    }

}