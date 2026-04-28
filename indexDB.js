const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.static('public'));

mongoose.connect('mongodb://localhost:27017/taskDB')
  .then(() => {
    console.log('Connected to taskDB');
  })
  .catch((err) => {
    console.log('MongoDB connection error:', err.message);
  });

const taskSchema = new mongoose.Schema({
  taskID: {
    type: Number,
    required: true,
    min: 1
  },
  taskName: {
    type: String,
    required: true,
    minlength: 3
  },
  status: {
    type: String,
    required: true,
    enum: ['Started', 'In Progress', 'Completed']
  },
  remark: {
    type: String,
    default: '-'
  }
});

const Task = mongoose.model('Task', taskSchema, 'tasks');

app.get('/api/gettasks', async (req, res) => {
  const data = await Task.find().sort({ taskID: 1 });
  res.json(data);
});

app.post('/api/addtasks', async (req, res) => {
  const lastTask = await Task.find().sort({ taskID: -1 }).limit(1);

  let newID = 1;
  if (lastTask.length > 0) {
    newID = lastTask[0].taskID + 1;
  }

  const newTask = new Task({
    taskID: newID,
    taskName: req.body.taskName,
    status: 'Started'
  });

  await newTask.save();

  const data = await Task.find().sort({ taskID: 1 });
  res.json(data);
});

app.put('/api/updatetasks/:id', async (req, res) => {
  const id = parseInt(req.params.id);

  const existingTask = await Task.findOne({ taskID: id });
  if (!existingTask) {
    return res.status(404).send('Task not found');
  }

  await Task.updateOne(
    { taskID: id },
    {
      $set: {
        taskName: req.body.taskName,
        status: req.body.status
      }
    }
  );

  const data = await Task.find().sort({ taskID: 1 });
  res.json(data);
});

app.delete('/api/deletetasks/:id', async (req, res) => {
  const id = parseInt(req.params.id);

  await Task.deleteOne({ taskID: id });

  const data = await Task.find().sort({ taskID: 1 });
  res.json(data);
});

app.get('/api/gettaskbyname', async (req, res) => {
  const name = req.query.name;

  const data = await Task.find({
    taskName: { $regex: name, $options: 'i' }
  }).sort({ taskID: 1 });

  if (data.length === 0) {
    return res.status(404).send('Task not found');
  }

  res.json(data);
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
