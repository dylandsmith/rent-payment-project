class PropertyOwner < User
  
  def get_data_structure
    @data_struct = []
    get_properties
    units = []
    delinquencies = []
    issues = []
    @properties.each do |property|
      units = property.units
      units.each do |unit|
        if unit.delinquency != nil
          delinquencies.push(unit.delinquency)
        end
      end
      units.each do |unit|
        if unit.maintanence_services != nil
          issues.push(unit.maintanence_services)
        end
      end
      @data_struct.push(title: property.title, units: units, delinquencies: delinquencies, issues: issues)
      delinquencies = []
      issues = []
    end
    return @data_struct
  end
  
  def get_properties
    @properties = self.properties
  end
  
  def get_delinquencies
    @delinquencies = Delinquency.all
  end
end
