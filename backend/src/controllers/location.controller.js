const httpStatus = require('http-status');
const Message = require('../utils/Message');
const catchAsync = require('../utils/catchAsync');
const locationService = require('../services/location.service');

const createLocation = catchAsync(async (req, res) => {
  const requestBody = req.body;
  requestBody.userId = req.params.userId;
  const location = await locationService.createLocation(requestBody);
  res.status(httpStatus.CREATED).send({
    code: httpStatus.CREATED,
    message: Message.locationMsg.created,
    result: location,
  });
});

const getLocationByLocationId = catchAsync(async (req, res) => {
  const location = await locationService.getLocationByLocationId(req.params.locationId);
  res.send({ code: httpStatus.OK, message: Message.ok, result: location });
});

const updateLocation = catchAsync(async (req, res) => {
  const { locationId } = req.params;
  const requestBody = req.body;
  await locationService.updateLocation({ locationId, requestBody });
  res.send({
    code: httpStatus.OK,
    message: Message.locationMsg.update,
  });
});

const deleteLocation = catchAsync(async (req, res) => {
  await locationService.deleteLocation(req.params.locationId);
  res.send({
    code: httpStatus.OK,
    message: Message.locationMsg.deleted,
  });
});

module.exports = {
  createLocation,
  getLocationByLocationId,
  updateLocation,
  deleteLocation,
};
