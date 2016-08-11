$:.unshift File.dirname(__FILE__)

$idf = Hash.new
data = File.read("#{Rails.root}/app/controllers/concerns/idf_dic.dat")
$idf = Marshal.load data
