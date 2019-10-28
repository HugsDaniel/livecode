require 'date'
require 'yaml'

SSN_PATTERN = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<zip>\d{2}|2[AB])\s?(\d{3})\s?(\d{3})\s?(?<key>\d{2})$/

def french_ssn_message(ssn)
  # Checker si le SSN est valide
  match_data = ssn.match(SSN_PATTERN)

  if match_data && is_valid?(match_data[:key].to_i, ssn)
    # Récupérer le gender
    gender = get_gender(match_data[:gender].to_i)
    # Récupérer le mois et le transformer en mot
    month = get_month(match_data[:month].to_i)
    # Récupérer l'année et ajouter 19 devant
    year = get_year(match_data[:year])
    # Récupérer le numéro de département et le transformer en mot
    department = get_department(match_data[:zip])
    # Construire la string avec les infos

    return "a #{gender}, born in #{month}, #{year} in #{department}."
  else
    # Sinon, message d'erreur
    return "The number is invalid"
  end
end

def is_valid?(key, ssn)
  # Supprimer les espaces du SSN
  # Récupérer les 13 premiers chiffres
  # Convertir en integer
  ssn_without_key = ssn.delete(" ")[0..12].to_i
  # Faire le calcul et comparer le reste à la clé
  (97 - ssn_without_key) % 97 == key
end

def get_gender(gender)
  gender == 1 ? "man" : "woman"
end

def get_month(month)
  return Date::MONTHNAMES[month]
end

def get_year(year)
  return "19" + year
end

def get_department(zip)
  YAML.load_file('data/french_departments.yml')[zip]
end

# "1 84 12 76 451 089 46"
