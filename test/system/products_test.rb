require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Applicable fluids", with: @product.applicable_fluids
    fill_in "Body material", with: @product.body_material
    fill_in "Category", with: @product.category
    fill_in "Description", with: @product.description
    fill_in "Extras", with: @product.extras
    fill_in "Name", with: @product.name
    fill_in "Pma", with: @product.pma
    fill_in "Pmo", with: @product.pmo
    fill_in "Status", with: @product.status
    fill_in "Tma", with: @product.tma
    fill_in "Tmo", with: @product.tmo
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Applicable fluids", with: @product.applicable_fluids
    fill_in "Body material", with: @product.body_material
    fill_in "Category", with: @product.category
    fill_in "Description", with: @product.description
    fill_in "Extras", with: @product.extras
    fill_in "Name", with: @product.name
    fill_in "Pma", with: @product.pma
    fill_in "Pmo", with: @product.pmo
    fill_in "Status", with: @product.status
    fill_in "Tma", with: @product.tma
    fill_in "Tmo", with: @product.tmo
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    accept_confirm { click_on "Destroy this product", match: :first }

    assert_text "Product was successfully destroyed"
  end
end
