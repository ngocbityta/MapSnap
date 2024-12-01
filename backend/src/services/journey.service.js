const httpStatus = require('http-status');
const mongoose = require('mongoose');
// const _ = require('lodash');
const Journey = require('../models/journey.model');
const ApiError = require('../utils/ApiError');
const Message = require('../utils/Message');
// const UserModel = require('../models/user.model');

const createJourney = async (journeyBody) => {
  const journey = await Journey.findOne(journeyBody);
  if (journey) {
    throw new ApiError(httpStatus.BAD_REQUEST, Message.journeyMsg.nameExisted);
  }
  const journeyModel = await Journey.create(journeyBody);
  return journeyModel;
};

const getJourney = async (journeyBody) => {
  const {
    userId,
    isAutomaticAdded,
    updatedByUser,
    sortType = 'desc',
    sortField = 'startedAt',
    status = 'enabled',
    searchText,
  } = journeyBody;
  const filter = { userId, status };
  if (isAutomaticAdded !== undefined) filter.isAutomaticAdded = isAutomaticAdded;
  if (updatedByUser !== undefined) filter.updatedByUser = updatedByUser;
  if (searchText) {
    filter.title = { $regex: searchText, $options: 'i' };
  }
  const sortOption = { [sortField]: sortType === 'asc' ? 1 : -1 };
  const journey = await Journey.find(filter).sort(sortOption);
  return journey;
};

const getJourneyByJourneyId = async (journeyId) => {
  const journey = await Journey.findById(journeyId);
  if (!journey) {
    throw new ApiError(httpStatus.NOT_FOUND, Message.notFound);
  }
  return journey;
};

const updateJourney = async ({ journeyId, requestBody }) => {
  const journeyModel = await Journey.findOneAndUpdate(journeyId, requestBody, { new: true });
  return journeyModel;
};

const deleteJourney = async (journeyId) => {
  await updateJourney({ journeyId, requestBody: { status: 'disabled' } });
};

const deleteHardJourney = async (journeyId) => {
  await Journey.findByIdAndDelete(journeyId);
};

const getJourneysToday = async (userId) => {
  let startOfDay = new Date();
  startOfDay.setHours(0, 0, 0, 0);
  startOfDay = startOfDay.getTime();
  let endOfDay = new Date();
  endOfDay.setHours(23, 59, 59, 999);
  endOfDay = endOfDay.getTime();
  const filter = {
    userId: mongoose.Types.ObjectId(userId),
    startedAt: { $gte: startOfDay, $lte: endOfDay },
  };

  const journeys = await Journey.find(filter);
  return journeys;
};

module.exports = {
  createJourney,
  getJourney,
  getJourneyByJourneyId,
  updateJourney,
  deleteJourney,
  getJourneysToday,
  deleteHardJourney,
};
