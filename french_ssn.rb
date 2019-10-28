require 'date'
require 'yaml'

SSN_PATTERN = /.../

def french_ssn_message(ssn)
  # TODO : Check validity of the SSN and return a sentence matching the user data
end


# Use the methods below to get month name from number
# and french department name from zipcode

def get_month(month_number)
  return Date::MONTHNAMES[month_number]
end

def get_department(zipcode)
  YAML.load_file('data/french_departments.yml')[zipcode]
end
