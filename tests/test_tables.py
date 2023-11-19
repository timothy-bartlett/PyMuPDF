import os
import io
from pprint import pprint
import fitz
import pickle

scriptdir = os.path.abspath(os.path.dirname(__file__))
filename = os.path.join(scriptdir, "resources", "chinese-tables.pdf")
pickle_file = os.path.join(scriptdir, "resources", "chinese-tables.pickle")


def test_table1():
    """Compare pickled tables with those of the current run."""
    pickle_in = open(pickle_file, "rb")
    doc = fitz.open(filename)
    page = doc[0]
    tabs = page.find_tables()
    cells = [tabs[0].cells, tabs[1].cells]
    extracts = [tabs[0].extract(), tabs[1].extract()]
    new_data = {"cells": cells, "extracts": extracts}
    old_data = pickle.load(pickle_in)
    assert old_data == new_data


def test_table2():
    """Confirm header properties."""
    doc = fitz.open(filename)
    page = doc[0]
    tab1, tab2 = page.find_tables().tables
    # both tables contain their header data
    assert tab1.header.external == False
    assert tab1.header.cells == tab1.rows[0].cells
    assert tab2.header.external == False
    assert tab2.header.cells == tab2.rows[0].cells


def test_2812():
    """Ensure table detection and extraction independent from page rotation.

    Make 4 pages with rotations 0, 90, 180 and 270 degrees respectively.
    Each page shows the same 8x5 table.
    We will check that each table is detected and delivers the same content.
    """
    doc = fitz.open()
    # Page 0: rotation 0
    page = doc.new_page(width=842, height=595)
    rect = page.rect + (72, 72, -72, -72)
    cols = 5
    rows = 8
    # define the cells, draw the grid and insert unique text in each cell.
    cells = fitz.make_table(rect, rows=rows, cols=cols)
    for i in range(rows):
        for j in range(cols):
            page.draw_rect(cells[i][j])
    for i in range(rows):
        for j in range(cols):
            page.insert_textbox(
                cells[i][j],
                f"cell[{i}][{j}]",
                align=fitz.TEXT_ALIGN_CENTER,
            )
    page.clean_contents()

    # Page 1: rotation 90 degrees
    page = doc.new_page()
    rect = page.rect + (72, 72, -72, -72)
    cols = 8
    rows = 5
    cells = fitz.make_table(rect, rows=rows, cols=cols)
    for i in range(rows):
        for j in range(cols):
            page.draw_rect(cells[i][j])
    for i in range(rows):
        for j in range(cols):
            page.insert_textbox(
                cells[i][j],
                f"cell[{j}][{rows-i-1}]",
                rotate=90,
                align=fitz.TEXT_ALIGN_CENTER,
            )
    page.set_rotation(90)
    page.clean_contents()

    # Page 2: rotation 180 degrees
    page = doc.new_page(width=842, height=595)
    rect = page.rect + (72, 72, -72, -72)
    cols = 5
    rows = 8
    cells = fitz.make_table(rect, rows=rows, cols=cols)
    for i in range(rows):
        for j in range(cols):
            page.draw_rect(cells[i][j])
    for i in range(rows):
        for j in range(cols):
            page.insert_textbox(
                cells[i][j],
                f"cell[{rows-i-1}][{cols-j-1}]",
                rotate=180,
                align=fitz.TEXT_ALIGN_CENTER,
            )
    page.set_rotation(180)
    page.clean_contents()

    # Page 3: rotation 270 degrees
    page = doc.new_page()
    rect = page.rect + (72, 72, -72, -72)
    cols = 8
    rows = 5
    cells = fitz.make_table(rect, rows=rows, cols=cols)
    for i in range(rows):
        for j in range(cols):
            page.draw_rect(cells[i][j])
    for i in range(rows):
        for j in range(cols):
            page.insert_textbox(
                cells[i][j],
                f"cell[{cols-j-1}][{i}]",
                rotate=270,
                align=fitz.TEXT_ALIGN_CENTER,
            )
    page.set_rotation(270)
    page.clean_contents()

    pdfdata = doc.tobytes()
    # doc.ez_save("test-2812.pdf")
    doc.close()

    # -------------------------------------------------------------------------
    # Test PDF prepared. Extract table on each page and
    # ensure identical extracted table data.
    # -------------------------------------------------------------------------
    doc = fitz.open("pdf", pdfdata)
    extracts = []
    for page in doc:
        tabs = page.find_tables()
        assert len(tabs.tables) == 1
        tab = tabs[0]
        fp = io.StringIO()
        pprint(tab.extract(), stream=fp)
        extracts.append(fp.getvalue())
        fp = None
        assert tab.row_count == 8
        assert tab.col_count == 5
    e0 = extracts[0]
    for e in extracts[1:]:
        assert e == e0
