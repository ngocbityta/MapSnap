const mongoose = require('mongoose');
const { toJSON } = require('./plugins');

const { Schema } = mongoose;

// Define the Picture schema
const pictureSchema = new Schema({
  user_id: {
    type: String,
    ref: 'User',
    required: true,
    index: true,
  },
  location_id: {
    type: String,
    ref: 'Location',
    required: true,
  },
  visit_id: {
    type: String,
    ref: 'Visit',
    required: true,
  },
  journey_id: {
    type: String,
    ref: 'Journey',
    required: true,
  },
  link: {
    type: String,
    required: true,
  },
  created_at: {
    type: Number,
    required: true,
  },
});

pictureSchema.plugin(toJSON);

// Create the Picture model
const Picture = mongoose.model('Picture', pictureSchema);

module.exports = Picture;
