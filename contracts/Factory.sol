pragma solidity ^0.4.8;


/// @title Contracts' factory
/// @author Stefan George - <stefan.george@consensys.net>
contract Factory {

    event ContractInstantiation(address sender, address instantiation);

    mapping(address => bool) public isInstantiation;
    mapping(address => address[]) public instantiations;
    address[] public instances;

    /// @dev Returns number of instantiations by creator.
    /// @param creator Contract creator.
    /// @return Returns number of instantiations by creator.
    function getInstantiationCount(address creator)
        public
        constant
        returns (uint)
    {
        return instantiations[creator].length;
    }


    /// @dev Registers contract in factory registry.
    /// @param instantiation Address of contract instantiation.
    function register(address instantiation)
    {
        instances.push(instantiation);
        isInstantiation[instantiation] = true;
        instantiations[msg.sender].push(instantiation);
        ContractInstantiation(msg.sender, instantiation);
    }
}
