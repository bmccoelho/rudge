class Rudge
  class Abbreviations
    TITLES = %w(jr mr mrs ms dr prof sr sen rep rev gov atty
                supt det rev col gen lt cmdr adm capt sgt cpl maj)

    ENTITIES = %w(dept univ uni assn bros inc ltd co corp plc)

    MONTHS = %w(jan feb mar apr may jun jul aug sep sept oct nov dec)

    DAYS = %w(mon tue wed thu fri sat sun)

    ADDRESSES = %w(ave bld blvd cl ct cres dr rd st)

    MISC = %w(vs etc no esp cf)

    def self.list
      list = TITLES + ENTITIES + MONTHS + DAYS + ADDRESSES + MISC
      list = list + list.map { |a| a.capitalize} 
    end

  end
end
