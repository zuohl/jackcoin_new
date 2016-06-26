if (typeof dwr == 'undefined' || dwr.engine == undefined) throw new Error('You must include DWR engine before including this file');

(function() {
  if (dwr.engine._getObject("FirmManager") == undefined) {
    var p;
    
    p = {};
    p._path = '/SelfOpenAccount/dwr';

    /**
     * @param {class java.lang.String} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.getBrokerId = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'getBrokerId', arguments);
    };

    /**
     * @param {class java.lang.String} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.checkAccountNum = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'checkAccountNum', arguments);
    };

    /**
     * @param {class java.lang.String} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.checkedCardNumber = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'checkedCardNumber', arguments);
    };

    /**
     * @param {class java.lang.String} p0 a param
     * @param {class java.lang.String} p1 a param
     * @param {function|Object} callback callback function or options object
     */
    p.checkedCardNumberBycardType = function(p0, p1, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'checkedCardNumberBycardType', arguments);
    };

    /**
     * @param {int} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.getBrokerListByIdAndName = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'getBrokerListByIdAndName', arguments);
    };

    /**
     * @param {int} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.getBrokerListByIdAndNameAndmem = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'getBrokerListByIdAndNameAndmem', arguments);
    };

    /**
     * @param {class java.lang.String} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.sendSMS = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'sendSMS', arguments);
    };

    /**
     * @param {class java.lang.String} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.checkedFirmById = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'checkedFirmById', arguments);
    };

    /**
     * @param {class java.lang.String} p0 a param
     * @param {function|Object} callback callback function or options object
     */
    p.sendMessage = function(p0, callback) {
      return dwr.engine._execute(p._path, 'FirmManager', 'sendMessage', arguments);
    };
    
    dwr.engine._setObject("FirmManager", p);
  }
})();

