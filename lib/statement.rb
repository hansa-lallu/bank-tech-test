class Statement

  
  def header
    "date || credit || debit || balance"
  end

  def date
    Time.now.strftime("%d/%m/%Y")
  end
end