module RailsAdminPdf
end

require 'rails_admin/config/actions'
require 'prawn'
require 'gruff'

module RailsAdmin
  module Config
    module Actions
      class Pdf < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :pajax? do
          false
        end

        register_instance_option :controller do
          Proc.new do
            PDF_OPTION = {
                :page_size => "A4",
                :page_layout => :portrait,
                :margin => [40, 75]
            }

            ramdom_file_name = (0...8).map { (65 + rand(26)).chr }.join

            Prawn::Document.new(PDF_OPTION) do |pdf|
              pdf.fill_color "666666"
              pdf.text "Relatório do Representante", :size => 32, :style => :bold, :align => :center
              pdf.move_down 80

              pdf.text "Dados Pessoas", :size => 14, :align => :justify, :inline_format => true
              pdf.move_down 14

              if @object.name
                pdf.text "Nome: #{@object.name}", :size => 12, :align => :justify, :inline_format => true
                pdf.move_down 8
              end

              if @object.document
                pdf.text "Documento: #{@object.document}", :size => 12, :align => :justify, :inline_format => true
                pdf.move_down 8
              end

              if @object.kind
                pdf.text "Tipo: #{@object.kind}", :size => 12, :align => :justify, :inline_format => true
                pdf.move_down 8
              end

              if @object.status
                pdf.text "Status: #{@object.status}", :size => 12, :align => :justify, :inline_format => true
                pdf.move_down 8
              end

              if @object.email
                pdf.text "E-mail: #{@object.email}", :size => 12, :align => :justify, :inline_format => true
                pdf.move_down 8
              end

              pdf.move_down 20

              if @object.comissions.where(status: :pending).count > 0
                pdf.text "Comissoes Pendentes", :size => 14, :align => :justify, :inline_format => true, :style => :bold
                pdf.move_down 14

                total = 0

                @object.comissions.where(status: :pending).each do |c|
                  pdf.text "Id #{c.id}, valor R$#{c.value}, gerada em #{c.created_at.strftime("%d/%m/%y as %H:%M")}", :size => 12, align => :justify, :inline_format => true
                  pdf.move_down 8

                  total += c.value
                end

                pdf.move_down 10
                pdf.text "Total: R$#{total}", :size => 12, :align => :justify, :inline_format => true
                pdf.move_down 20
              end

              if @object.clients.count > 0
                pdf.text "Clientes Ativos", :size => 14, :align => :justify, :inline_format => true, :style => :bold
                pdf.move_down 14

                total = 0

                @object.clients.each do |c|
                  pdf.text "#{c.name}", :size => 12, :align => :justify, :inline_format => true, :style => :bold
                  pdf.move_down 8

                  pdf.text "Da empresa #{c.company_name}", :size => 12, :align => :justify, :inline_format => true
                  pdf.move_down 8

                  pdf.text "Cliente desde #{c.created_at.strftime("%d/%m/%y as %H:%M")}", :size => 12, :align => :justify, :inline_format => true

                  total += 1
                end

                pdf.move_down 10
                pdf.text "Total: #{total}", :size => 12, :align => :justify, :inline_format => true
              end

              if @object.sales.count > 0
                g = Gruff::Pie.new 900
                g.theme = Gruff::Themes::PASTEL

                sales_value = {}
                @object.sales.each do |sale|
                  calc = 0
                  sale.product_quantities.each { |p| calc += p.product.price * p.quantity }
                  sales_values[sale.client.name] = (sales_values[sale.client.name])? sales_values[sale.client.name] + calc : calc
                end

                sales_value.each { |key, value| g.data(key, value) }
                g.write('public/graph.jpg')

                pdf.start_new_page

                pdf.image "public/graph.jpg", :scale => 0.50
              end

              pdf.font "Helvetica"
              pdf.text "Link para o manul do Prawn clicável", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
              pdf.number_pages "Gerado #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
              pdf.render_file("public/#{ramdom_file_name}.pdf")
            end

            File.open("public/#{ramdom_file_name}.pdf")
            File.open("public/graph.jpg") if @object.sales.count > 0

          end
        end

        register_instance_option :link_icon do
          'fa fa-file-pdf-o'
        end
      end
    end
  end
end